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
  azure_speech();
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

  // recognizer.recognizing = (s, e) => {};

  recognizer.recognized = (s, e) => {
    console.log(`RECOGNIZED: Text=${e.result.text}`);
    const txt = e.result.text.toLowerCase();

    console.log(txt);
    console.log(txt.includes("video"));
    if (txt.includes("mute")) {
      audiobtnclick();
    } else if (txt.includes("video")) {
      videobtnclick();
    }

    fetch(
      "https://api.us-east.natural-language-understanding.watson.cloud.ibm.com/instances/a1c64d0b-5d55-4c24-9d0a-9ad7251b630c/v1/analyze?version=2019-07-12",
      {
        body: JSON.stringify({
          text: txt,
          features: {
            sentiment: { targets: ["pause"] },
            keywords: { emotion: true },
          },
        }),
        headers: {
          Authorization: data.ibm,
          "Content-Type": "application/json",
        },
        method: "POST",
      }
    )
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
      });
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
  micOn = !micOn;
  console.log(micOn);
  publisher.publishAudio(micOn);
  if (micOn) {
    azure_speech();
    recognizer.startContinuousRecognitionAsync();
    document.getElementById("audiobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-microphone"></span>';
  } else {
    // recognizer.stopContinuousRecognitionAsync();
    document.getElementById("audiobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-microphone-off"></span>';
  }
}

window.addEventListener("beforeunload", function (event) {
  recognizer.stopContinuousRecognitionAsync();
});
