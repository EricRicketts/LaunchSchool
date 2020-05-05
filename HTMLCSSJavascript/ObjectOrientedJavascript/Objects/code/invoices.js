let invoices = {
  paid: [],
  unpaid: [],
  unrecognized: [],
  add: function(name, amount) {
    return this.unpaid.push({ name: name, amount: amount });
  },
  payInvoice: function(name) {
    let index = this.unpaid.findIndex((client) => {
      return name === client.name;
    });
    return index === -1 ? this.unrecognized.push(name) : this.paid.push(...this.unpaid.splice(index, 1));
  },
  totalDue: function() {
    return this.unpaid.reduce((sum, invoice) => sum + invoice.amount, 0);
  },
  totalPaid: function() {
    return this.paid.reduce((sum, invoice) => sum + invoice.amount, 0);
  },
}

export { invoices };