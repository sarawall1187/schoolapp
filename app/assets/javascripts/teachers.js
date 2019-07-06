$(() => {
    clickEventHandlers()
})

const clickEventHandlers = () => {
   $("#teachers").on('click', (e) => {
        e.preventDefault()  
    })
}