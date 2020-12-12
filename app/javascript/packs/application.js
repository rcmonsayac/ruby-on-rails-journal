// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

const addHeaderCollapse = (e) => {
  let taskHeaders = Array.from(document.querySelectorAll(".tasks-header"))
  console.log(taskHeaders)
  taskHeaders.forEach(taskHeader => {
    let tasksCount = Array.from(taskHeader.nextElementSibling.querySelectorAll(".task-list-item")).length
    console.log(tasksCount)
    taskHeader.firstElementChild.innerHTML = taskHeader.firstElementChild.innerHTML + `(${tasksCount})`
    taskHeader.addEventListener("click", (e) => {
      taskHeader.innerHTML = taskHeader.innerHTML.includes("-") ?  taskHeader.innerHTML.replace("-", "+") : taskHeader.innerHTML.replace("+", "-")
      taskHeader.nextElementSibling.classList.toggle("hidden")
    })
  })
}

// window.addEventListener('beforeunload', addHeaderCollapse)
window.addEventListener('DOMContentLoaded', addHeaderCollapse)