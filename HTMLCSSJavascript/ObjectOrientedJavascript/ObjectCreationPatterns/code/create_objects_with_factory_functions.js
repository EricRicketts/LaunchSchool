function createInvoice(services) {
  let invoice = {
    internet: 5500,
    phone: 3000,
    total: function() {
      return this.internet + this.phone;
    }
  }
  if (services) {
    Object.keys(services).forEach((key) => {
      invoice[key] = services[key];
    });
  }
  return invoice;
}

function createInvoiceNext(services) {
  services = services || {};
  return {
    internet: services.internet || 5500,
    phone: services.phone || 3000,
    amount: services.amount || 0,
    payments: [],
    addPayment: function(payment) {
      return this.payments.push(payment);
    },
    addPayments: function(arr) {
      arr.forEach((payment) => {
        this.payments.push(payment);
      });
      return this.payments;
    },
    amountDue: function() {
      this.makePhonePayment();
      this.makeInternetPayment();
      this.distributeRemainingAmount();
      return this.total();
    },
    distributeRemainingAmount: function() {
      this.amount += this.sumAmountPayments();
      this.payments.forEach((payment) => {
        payment.amount = 0;
      });
      if (this.phone > 0 && this.phone >= this.amount) {
        this.phone -= this.amount;
        this.amount = 0;
      } else if (this.phone > 0 && this.phone < this.amount) {
        this.amount -= this.phone;
        this.phone = 0;
      }

      if (this.internet > 0 && this.internet >= this.amount) {
        this.internet -= this.amount;
        this.amount = 0;
      } else if (this.internet > 0 && this.internet < this.amount) {
        this.amount -= this.internet;
        this.internet = 0;
      }
    },
    makeInternetPayment: function() {
      if (this.sumInternetPayments() > this.internet) {
        this.amount += this.sumInternetPayments() - this.internet;
        this.internet = 0;
        this.payments.forEach((payment) => {
          payment.internet = 0;
        });
      } else {
        this.internet -= this.sumInternetPayments();
        this.payments.forEach((payment) => {
          payment.internet = 0;
        });
      }
    },
    makePhonePayment: function() {
      if (this.sumPhonePayments() > this.phone) {
        this.amount += this.sumPhonePayments() - this.phone;
        this.phone = 0;
        this.payments.forEach((payment) => {
          payment.phone = 0;
        });
      } else {
        this.phone -= this.sumPhonePayments();
        this.payments.forEach((payment) => {
          payment.phone = 0;
        });
      }
    },
    sumAmountPayments: function() {
      return this.payments.reduce((sum, payment) => {
        let amount = payment.amount || 0;
        sum += amount;
        return sum;
      }, 0);
    },
    sumInternetPayments: function() {
      return this.payments.reduce((sum, payment) => {
        let amount = payment.internet || 0;
        sum += amount;
        return sum;
      }, 0);
    },
    sumPhonePayments: function() {
      return this.payments.reduce((sum, payment) => {
        let amount = payment.phone || 0;
        sum += amount;
        return sum;
      }, 0);
    },
    total: function() {
      return this.internet + this.phone;
    },
  }
}

function createPayment(services) {
  services = services || {};
  return {
    internet: services.internet || 0,
    phone: services.phone || 0,
    amount: services.amount || 0,
    total: function() {
      return this.internet + this.phone + this.amount;
    }
  }
}

function invoiceTotal(invoices) {
  let total = 0;
  let numberOfInvoices = invoices.length;

  for (let i = 0; i < numberOfInvoices; i += 1) {
    total += invoices[i].total();
  }

  return total;
}

function makeObj() {
  return {
    propA: 10,
    propB: 20
  }
}

function paymentTotal(payments) {
  let total = 0;
  let numberOfPayments = payments.length;

  for (let i = 0; i < numberOfPayments; i += 1) {
    total += payments[i].total();
  }

  return total;
}

export { createInvoice, createInvoiceNext, createPayment, invoiceTotal, paymentTotal, makeObj };

/*
The Launch School solution for createInvoice was far more efficient than what I did:

function createInvoice(services) {
  services = services || {};
  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,
    total: function() {
      return this.phone + this.internet;
    },
  };
}

I never thought of using the || function combined with the services parameter
*/