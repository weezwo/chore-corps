class Task {
  constructor(obj) {
    console.log(obj)
    this.userName = obj["user"]["name"];
    this.dueDate = Date.parse(obj.due_date);
    this.completionDate = Date.parse(obj.completion_date)
    this.completionStatus = obj.completion_status;
  }

  formatDueDate(){
    return moment(this.dueDate).format('MM-DD-YYYY')
  }

  formatCompletionDate(){
    return moment(this.completionDate).format('MM-DD-YYYY')
  }
}
