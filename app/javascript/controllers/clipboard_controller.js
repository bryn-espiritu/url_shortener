import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["shortened_url"]

    copy() {
        let email = this.shortened_urlTarget.textContent
        navigator.clipboard.writeText(shortened_url)
        document.getElementsByClassName("notice")[0].innerHTML= 'your' + shortened_url + 'was successfully copied'
    }
}