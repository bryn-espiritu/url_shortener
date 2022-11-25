import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["source"]

    copy() {
        let source = this.sourceTarget.textContent
        navigator.clipboard.writeText(source)
        document.getElementsByClassName("notice")[0].innerHTML= 'your' + source + 'was successfully copied'
    }
}