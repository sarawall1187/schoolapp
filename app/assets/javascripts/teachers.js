$(() => {
    // clickEventHandlers()
    clickEventSchoolIndex()
})

// const clickEventHandlers = () => {
//    $("#teachers").on('click', (e) => {
//       e.preventDefault()  
      
//         fetch(`${this}.json`)
//             .then(res => res.json())
//             .then(teachers => {
//                 teachers.forEach((teacher) => {
//                     let newTeacher = new Teacher(teacher)
//                     let teacherHTML = newTeacher.formatIndex()
//                     $('#all_teachers').append(teacherHTML)
//                 })
//             })

//     })
// }


// function Teacher(teacher){
//     this.id = teacher.id
//     this.name = teacher.name
//     this.grade_taught = teacher.grade_taught
//     this.school = teacher.school
//     this.children = teacher.children
// }

// Teacher.prototype.formatIndex = function() {
//     let teacherHTML = `
//     <ul>
//      <li> <a>${this.name}, ${this.grade_taught}</a></li>
//     </ul>
//     `
//     return teacherHTML
// }
    




const clickEventSchoolIndex = () => {
    $("#all_schools").on('click', (e) => {
        e.preventDefault() 
        // alert('hello')
        fetch(`/schools.json`)
        .then((res) => res.json())
        .then(schools => {
            $('#schools-container').html('')
            schools.forEach((school) => {
                let newSchool = new School(school)
                let schoolHTML = newSchool.formatIndex()
                $('#schools-container').append(schoolHTML)
            })
        })
    })
}

function School(school){
    this.id = school.id
    this.name = school.name
    this.teachers = school.teachers
} 

School.prototype.formatIndex = function() {
    let schoolHTML = `
    <ul>
     <li> <a> ${this.name}</a></li>
    </ul>
    `
    return schoolHTML
}
  