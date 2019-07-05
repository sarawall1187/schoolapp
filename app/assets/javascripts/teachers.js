$(() => {
    clickEventHandlers()
})

const clickEventHandlers = () => {
    $('.get_all_teachers').on('submit', (e) => {
       
        e.preventDefault()
        alert("hello")
        console.log('hello')
    })
}