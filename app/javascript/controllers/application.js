import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

if ("serviceWorker" in navigator) {
  window.addEventListener("load", () => {
    navigator.serviceWorker
      .register("/service_worker.js")
      .then(() => console.log("SW registered"))
      .catch(err => console.error(err));
  });
}

export { application }
