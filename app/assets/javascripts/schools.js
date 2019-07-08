$(() => {
    clickEventSchoolIndex()
})

const clickEventSchoolIndex = () => {
    $("#all_schools").on('click', (e) => {
        e.preventDefault() 
        // alert('hello')
        fetch(`/schools.json`)
        .then(res => res.json())
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
} 

School.prototype.formatIndex = function() {
    let schoolHTML = `
    <ul>
     <li> <a>${this.name}</a></li>
    </ul>
    `
    return schoolHTML
}
  