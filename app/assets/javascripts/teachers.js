$(() => {
    clickEventHandlers()
})
// $(document).ready(function() {
//     clickEventHandlers()
//   })

const clickEventHandlers = () => {
   $("#teachers").on('click' (e) => {
        alert("hello")  
        e.preventDefault()  
    })
}