$(() => {
    clickEventHandlers()
    clickEventSchool()
})

const clickEventHandlers = () => {
    $(document).on('click', '#add_teacher', function(e){     
        $.get('/teachers/new', function(){
           $('#new_teacher').html("<%= j (render: 'teachers/new') %>")
             })   
         })

    $('#new_teacher').on('submit', function(e){
            e.preventDefault()
            const values = $(this).serialize()
            // console.log(values)
            $.post('/teachers', values).done(function(data) {
                console.log(data)
            })
     })
   
//    $("#teachers").on('click', (e) => {
//       e.preventDefault()  
//     //   history.pushState(null, null, "teachers")
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
}


function Teacher(teacher){
    this.id = teacher.id
    this.name = teacher.name
    this.grade_taught = teacher.grade_taught
    this.school_id = teacher.school_id
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
    




