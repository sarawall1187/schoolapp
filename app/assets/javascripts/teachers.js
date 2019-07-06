$(() => {
    clickEventHandlers()
})

const clickEventHandlers = () => {
   $("#teachers").on('click', (e) => {
      e.preventDefault()  
        fetch(`${this}/teachers.json`)
            .then(res => res.json())
            .then(data => console.log(data))

    })
}