
const DOMMap = {
    addCarButtonId: 'addCarToGarage',
    showAddFormButtonId: 'showAddForm',
    modalFormId: 'modalForm'
}

const notesCollection = [];

let noteId = 0;

let currentNoteForEdit;

let noteSheet = document.getElementById(DOMMap.noteSheetId);
let addCarButton = document.getElementById(DOMMap.addCarButtonId);

var show = function(){
    document.getElementById('modalForm').style.display = 'block';
    document.getElementById('filter').style.display = 'block';    
}

var Hide = function(){
    document.getElementById('modalForm').style.display = 'none';
    document.getElementById('filter').style.display = 'none';
}

//addCarButton.onclick = show;



