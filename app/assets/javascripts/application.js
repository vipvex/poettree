// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require_tree .



$(document).ready(function() {
	$('#hamburger').click(function() {
		$(this).toggleClass('open');
	})


	// Find Elements
	const previewBtn = document.querySelector(".preview-btn")
	const body = document.querySelector("body")

	// Create & Mutate Elements
	const overlay = document.createElement("div")
	overlay.className = "hidden overlay"
	const modal = document.createElement("div")
	modal.className = "hidden modal"

	//Add Elements to Page
	body.appendChild(overlay)
	body.appendChild(modal)

	// Event Functions

	const modalOverlayToggle = () => {
		overlay.classList.toggle("hidden")
		modal.classList.toggle("hidden")
	}
	
	const previewVideoModalToggle = () => {
		modal.classList.toggle("preview-video-modal")
	}
	
	const renderPreviewModalContent = () => {
		const heading = document.createElement("h2")
		heading.innerText = "This is What We Do"
		const iframe = document.createElement("iframe")
		iframe.classList.add("preview-video")
		iframe.setAttribute("src", "https://www.youtube.com/embed/rA9pZwDn6mU")
		iframe.setAttribute("frameborder", 0)
		iframe.setAttribute("allow", "encrypted-media")
		
		modal.appendChild(heading)
		modal.appendChild(iframe)
	}

	// Attach Event Listeners


	previewBtn.addEventListener("click", () => {
		modalOverlayToggle()
		previewVideoModalToggle()
		renderPreviewModalContent()
	})
	overlay.addEventListener("click", () => {
		modalOverlayToggle()
	})

})
