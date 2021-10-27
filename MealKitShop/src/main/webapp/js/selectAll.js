function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('all_select');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}