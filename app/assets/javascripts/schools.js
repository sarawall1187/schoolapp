
const clickEventSchool = () => {
    $("#all_schools").on('click', (e) => {
        e.preventDefault() 
        // history.pushState(null, null, "schools")
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

    $(document).on('click', '#show_link', function (e){
        e.preventDefault()
        let id = $(this).attr('data-id')
        fetch(`/schools/${id}.json`)
        .then((res) => res.json())
        .then(school => {
            $('#schools-container').html('')
             let newSchool = new School(school)
             let schoolHTML = newSchool.formatShow()
             $('#schools-container').append(schoolHTML)
        })
    })

}

function School(school){
    this.id = school.id
    this.name = school.name
    this.teachers = school.teachers
    this.created_at = school.created_at
} 

School.prototype.formatIndex = function() {
    let schoolHTML = `
    <ul>
     <li> <a href="/schools/${this.id}" data-id="${this.id}" id="show_link"> ${this.name}</a></li>
    </ul>
    `
    return schoolHTML
}

School.prototype.formatShow = function() {
    let teacherName = this.teachers.map(teacher => {
        if (teacher.name !== null){
      return `<li>${teacher.name}</li>` 
    }})
    let schoolHTML = `
    <h1>${this.name}</h1>
    <h3>Established: ${this.created_at}</h3>
   
  
    <h3>Faculty:</h3>
    <ul> 
    ${teacherName.join('')} 
    </ul>
    `
    return schoolHTML

}