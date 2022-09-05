// Get the form and file field
let form = document.querySelector('#upload');
let file = document.querySelector('#file');

// Listen for submit events
form.addEventListener('submit', handleSubmit);

function handleSubmit (event) {

	// Stop the form from reloading the page
	event.preventDefault();
}

function handleSubmit (event) {

	// Stop the form from reloading the page
	event.preventDefault();

	// If there's no file, do nothing
	if (!file.value.length) return;

}

function handleSubmit (event) {

	// Stop the form from reloading the page
	event.preventDefault();

	// If there's no file, do nothing
	if (!file.value.length) return;

	// Create a new FileReader() object
	let reader = new FileReader();

}

function handleSubmit (event) {

	// Stop the form from reloading the page
	event.preventDefault();

	// If there's no file, do nothing
	if (!file.value.length) return;

	// Create a new FileReader() object
	let reader = new FileReader();

	// Read the file
	reader.readAsText(file.files[0]);

}

function handleSubmit (event) {

	// Stop the form from reloading the page
	event.preventDefault();

	// If there's no file, do nothing
	if (!file.value.length) return;

	// Create a new FileReader() object
	let reader = new FileReader();

	// Setup the callback event to run when the file is read
	reader.onload = logFile;

	// Read the file
	reader.readAsText(file.files[0]);

}


function logFile (event) {
	let str = event.target.result;
	let json = JSON.parse(str);
    console.log(json);

    drawPlanner(json);


}


function drawPlanner (json) {
    let planner = document.querySelector('#planner');
    planner.innerHTML = '';
    for (let s = 0; s < json.length; s++) {
        let semester = json[s];
        let semesterDiv = document.createElement('div');
        semesterDiv.className = 'semester';
        let semesterHeader = document.createElement('h2');
        semesterHeader.innerHTML = `Semestre ${s + 1}`;
        semesterDiv.appendChild(semesterHeader);
		let semesterSubHeader = document.createElement('p');
		if (s % 2 == 0) {
			semesterSubHeader.innerHTML = `1er Semestre`;
		} else  {
			semesterSubHeader.innerHTML = `2do Semestre`;
		}
		semesterDiv.appendChild(semesterSubHeader);
        
		for (let c = 0; c < semester.length; c++) {
            const course = semester[c];

            let courseDiv = document.createElement('div');

			courseDiv.setAttribute('id', course.name)
			let approved = course.approved ? 'approved' : '';
			let dictates = course.dictates;
            courseDiv.className = 'course ' + approved;;
            if (course.prerequisites.length > 0 || course.corequisites.length > 0) {
				courseDiv.innerHTML = `
					<div class="course-title">${course.name}</div>
					<div class="course-dictates"> dictates_on: ${dictates}</div><hr>
					<div class="course-prerequisites"> prereq: ${(function() {
						let str = '';
						for (let i = 0; i < course.prerequisites.length; i++) {
							str += course.prerequisites[i] + '<br>';
						}
						return str;
					})()}</div><hr>
					<div class="course-prerequisites"> coreq: ${(function() {
						let str = '';
						for (let i = 0; i < course.corequisites.length; i++) {
							str += course.corequisites[i] + '<br>';
						}
						return str;
					})()}</div>
            	`;
			} else {
				courseDiv.innerHTML = `
				<div class="course-title">${course.name}</div>
				<div class="course-dictates"> dictates_on: ${dictates}</div>
				`;
			}

            semesterDiv.appendChild(courseDiv);			
        }
        planner.appendChild(semesterDiv);
    }

}