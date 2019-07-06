$(() => {
    clickEventHandlers()
})

const clickEventHandlers = () => {
   $("#teachers").on('click', (e) => {
      e.preventDefault()  
        fetch(`${this}/teachers.json`)
            .then(res => res.json())
            .then(teachers => {
                teachers.forEach((teacher) => {
                    let newTeacher = new Teacher(teacher)
                    let teacherHTML = newTeacher.formatIndex()
                    $('#all_teachers').append(teacherHTML)
                })
            })

    })
}


function Teacher(teacher){
    this.id = teacher.id
    this.name = teacher.name
    this.grade_taught = teacher.grade_taught
    this.school = teacher.school
    this.children = teacher.children
}

Teacher.prototype.formatIndex = function() {
    let teacherHTML = `
    <ul>
   <li> <a>${this.name}, ${this.grade_taught}</a></li>
   </ul>
    `
    return teacherHTML
}
    