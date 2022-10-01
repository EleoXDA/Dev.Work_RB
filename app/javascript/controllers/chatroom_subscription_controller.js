import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { challengeId: Number }
  static targets = ["comments"]

  connect() {
    {
      this.channel = createConsumer().subscriptions.create(
        { channel: "ChatroomChannel", id: this.challengeIdValue },
        { received: data => this.#insertCommentAndScrollDown(data) },
      )
      console.log(`Subscribed to the chatroom with the id ${this.challengeIdValue}.`)
    }
  }
  resetForm(event) {
    event.target.reset()
  }
  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertCommentAndScrollDown(data) {
    this.commentsTarget.insertAdjacentHTML("beforeend", data)
    this.commentsTarget.scrollTo(0, this.commentsTarget.scrollHeight)
  }
}
