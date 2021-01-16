// replace these values with those generated in your TokBox Account
var apiKey = "47084544";
var sessionId =
  "1_MX40NzA4NDU0NH5-MTYxMDgyNzE5OTAzMn5wbVdycklHeVZUbVpmNnNKSklsU0FENlJ-fg";
var token =
  "T1==cGFydG5lcl9pZD00NzA4NDU0NCZzaWc9NDkyZTkzNzg0OTFjYTA5NWJkMmNjMGU1OTMwNzllODUwY2VkZGMyYjpzZXNzaW9uX2lkPTFfTVg0ME56QTRORFUwTkg1LU1UWXhNRGd5TnpFNU9UQXpNbjV3YlZkeWNrbEhlVlpVYlZwbU5uTktTa2xzVTBGRU5sSi1mZyZjcmVhdGVfdGltZT0xNjEwODI3OTA0Jm5vbmNlPTAuMzU3ODc0NzIwMTQ1MzM3NiZyb2xlPXB1Ymxpc2hlciZleHBpcmVfdGltZT0xNjEwODMxNTA0JmluaXRpYWxfbGF5b3V0X2NsYXNzX2xpc3Q9";

// (optional) add server code here
initializeSession();

// Handling all of our errors here by alerting them
function handleError(error) {
  if (error) {
    alert(error.message);
  }
}

function initializeSession() {
  var session = OT.initSession(apiKey, sessionId);

  // Subscribe to a newly created stream
  session.on("streamCreated", function (event) {
    session.subscribe(
      event.stream,
      "subscriber",
      {
        insertMode: "append",
        width: "100%",
        height: "100%",
      },
      handleError
    );
  });

  // Create a publisher
  var publisher = OT.initPublisher(
    "publisher",
    {
      insertMode: "append",
      width: "100%",
      height: "100%",
    },
    handleError
  );

  // Connect to the session
  session.connect(token, function (error) {
    // If the connection is successful, publish to the session
    if (error) {
      handleError(error);
    } else {
      session.publish(publisher, handleError);
    }
  });
}
