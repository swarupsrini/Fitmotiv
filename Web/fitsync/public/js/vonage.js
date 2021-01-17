let publisher;
let vidOn = false;
let micOn = false;
let sdk;
let recognizer;
let speechConfig;
initializeSession();
init_sdk();

function init_sdk() {
  if (!!window.SpeechSDK) {
    sdk = window.SpeechSDK;
  }
  // azure_speech();
}
// Handling all of our errors here by alerting them
function handleError(error) {
  if (error) {
    alert(error.message);
  }
}

function initializeSession() {
  let session = OT.initSession(data.api_key, data.sessionID);
  // Subscribe to a newly created stream
  session.on("streamCreated", function (event) {
    session.subscribe(
      event.stream,
      "subscriber",
      {
        insertMode: "append",
        width: "100%",
        height: "100%",
        style: { buttonDisplayMode: "off" },
      },
      handleError
    );
  });

  // Create a publisher
  publisher = OT.initPublisher(
    "publisher",
    {
      insertMode: "append",
      width: "100%",
      height: "100%",
      style: { buttonDisplayMode: "off" },
      publishAudio: micOn,
      publishVideo: vidOn,
    },
    handleError
  );

  // Connect to the session
  session.connect(data.token, function (error) {
    // If the connection is successful, publish to the session
    if (error) {
      handleError(error);
    } else {
      session.publish(publisher, handleError);
      // azure_speech();
    }
  });
}

function azure_speech() {
  speechConfig = sdk.SpeechConfig.fromSubscription(data.azure, "eastus");
  let audioConfig = sdk.AudioConfig.fromDefaultMicrophoneInput();
  recognizer = new sdk.SpeechRecognizer(speechConfig, audioConfig);

  console.log("Speak into your microphone.");
  recognizer.recognized = (s, e) => {
    console.log(`RECOGNIZED: Text=${e.result.text}`);
  };
  recognizer.recognizing = (s, e) => {
    console.log(`RECOGNIZING: Text=${e.result.text}`);
  };
  recognizer.startContinuousRecognitionAsync();
}

function videobtnclick(event) {
  vidOn = !vidOn;
  console.log(vidOn);
  publisher.publishVideo(vidOn);
  if (vidOn) {
    document.getElementById("videobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-video"></span>';
  } else {
    document.getElementById("videobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-video-off"></span>';
  }
}

function audiobtnclick(event) {
  azure_speech();
  micOn = !micOn;
  console.log(micOn);
  publisher.publishAudio(micOn);
  if (micOn) {
    document.getElementById("audiobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-microphone"></span>';
  } else {
    document.getElementById("audiobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-microphone-off"></span>';
  }
}
