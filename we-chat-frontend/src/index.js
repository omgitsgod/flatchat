document.addEventListener("DOMContentLoaded", function(event) {
  const ActionCable = require('actioncable')

  let App
  App = App || {}

  App.cable = ActionCable.createConsumer('ws://localhost:3000/cable')

  App.group = App.cable.subscriptions.create('GroupChannel', {
    // normal channel code goes here...
    connected: function() {

    },

    disconnect: function() {

    },

    received: function(data) {
      const messages = document.querySelector("#messages")
      let newMessage = document.createElement("li")
      newMessage.innerHTML = data
      messages.appendChild(newMessage)
    },

    speak: function(message) {
      this.perform('speak', {message: message})
    }

  });
  setTimeout(function() {
    App.group.speak("hello");
  }, 5000)
})
