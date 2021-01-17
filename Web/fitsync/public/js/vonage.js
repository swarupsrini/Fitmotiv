let publisher;
let vidOn = true;
let micOn = true;

initializeSession();

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
      publishAudio: true,
      publishVideo: true,
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
    }
  });
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
    document.getElementById("audiobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-microphone"></span>';
  } else {
    document.getElementById("audiobtn").innerHTML =
      '<span class="btnicon iconify" data-icon="bx:bx-microphone-off"></span>';
  }
}
