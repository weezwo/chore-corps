class Chore {
  constructor(obj){
    this.id = obj.id;
    this.name = obj.name;
    this.cycle = obj.cycle;
    this.last_completed = Date.parse(obj.last_completed);
    this.notes = obj.notes;
    this.created_at = Date.parse(obj.created_at);
    this.updated_at = Date.parse(obj.updated_at);
    this.tasks = [];
    for(let i = 0; i < obj.tasks.length; i++){
      this.tasks.push(new Task(obj.tasks[i]));
    }
  }

  frequency() {
    return this.cycle / 86400
  }

  formatFrequency() {
    return this.frequency() === 1 ? "day" : `${this.frequency()} days`;
  }

  calculateDueDate() {
    return (this.last_completed || this.created_at) + this.cycle * 1000
  }

  formatDueDate() {
    return moment(this.calculateDueDate()).format('dddd, MMMM Do')
  }

  isOverdue() {
    return this.calculateDueDate() < Date.now();
  }

  isClaimed() {
    function isPending(task){
      return task.completionStatus === 'pending';
    }
    return this.tasks.some(isPending);
  }

  currentTask() {
    return this.tasks.filter(function(task){
      return task.completionStatus === 'pending'
    })[0];
  }

  currentClaimant() {
    var task = this.currentTask();
    return task.userName
  }
}
