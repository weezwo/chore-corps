class Chore {
  constructor(obj){
    this.id = obj.id;
    this.name = obj.name;
    this.cycle = obj.cycle;
    this.last_completed = obj.last_completed;
    this.notes = obj.notes;
    this.created_at = obj.created_at;
    this.updated_at = obj.updated_at;
  }

  frequency() {
    return this.cycle / 86400
  }

  formatFrequency() {
    var pluralizedDay = this.frequency() === 1 ? "day" : "days"
    return `${this.frequency()} ${pluralizedDay}`
  }
}
