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
	const loginModal = document.querySelector(".login-modal-ctr")
	const signUp = document.querySelector("nav .primary-red")
	const videoPreview = document.querySelector(".preview-video-ctr")
	// Create & Mutate Elements
	const overlay = document.createElement("div")
	overlay.className = "hidden overlay"
	const modal = document.createElement("div")
	modal.className = "hidden modal"

	//Add Elements to Page
	body.appendChild(overlay)
	body.appendChild(modal)

	// Event Functions


	const overlayToggle = () => {
		overlay.classList.toggle("hidden")
	}
	const modalToggle = () => {
		modal.innerHTML = ""
		modal.classList.toggle("hidden")
	}
	const modalOverlayToggle = () => {
		overlay.classList.toggle("hidden")
		modal.innerHTML = ""
		modal.classList.toggle("hidden")
	}

	const modalChildClassToggle = (className) => {
		const ele = document.querySelector("." + className)
		ele.classList.toggle("hidden")
	}

	const renderVideoPreviewModal = () => {
		videoPreview.classList.toggle("hidden")
		overlay.setAttribute('data', 'preview-video-ctr')
		modal.appendChild(videoPreview)
	}

	const renderLoginModal = () => {
		loginModal.classList.toggle("hidden")
		overlay.setAttribute('data', 'login-modal-ctr')
		modal.appendChild(loginModal)
	}

	// Attach Event Listeners

	signUp.addEventListener("click", (e) => {
		e.preventDefault()
		modalOverlayToggle()
		renderLoginModal()

	})
	previewBtn.addEventListener("click", () => {
		modalOverlayToggle()
		renderVideoPreviewModal()
	})

	overlay.addEventListener("click", (e) => {
		const className = e.target.getAttribute("data")
		modalChildClassToggle(className)
		modalOverlayToggle()
		overlay.setAttribute("data", "")
	})

})
