$(() => {
    clickEventTeachers()
})

const clickEventTeachers = () => {
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
               $('#schools-container').html('')
               let newTeacher = new Teacher(data)
               let teacherHTML = newTeacher.formatShow()
               $('#schools-container').append(teacherHTML)
            })
     })

}

class Teacher {
   constructor(teacher){
    this.id = teacher.id
    this.name = teacher.name
    this.grade_taught = teacher.grade_taught
    this.school_id = teacher.school_id
    this.children = teacher.children
}

  formatShow() {
    let teacherHTML = `
    <h1>Welcome aboard ${this.name}!</h1>
    <a href="/schools/${this.school_id}">Return to school page</a>
    `
    return teacherHTML
  }
    
}



