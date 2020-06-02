import { createInvoice, createInvoiceNext, createPayment, invoiceTotal, paymentTotal, makeObj } from "../code/create_objects_with_factory_functions";

describe('JS225 Object Creation Patterns', function () {
  describe('Practice Problems Set One', function () {
    describe('Create Objects With Factory Functions', function () {
      let obj, invoices, payments, results, expected;
      /*
        1.  What are the two disadvantages in working with factory functions?
            a.  Each object created from the factory function owns the same methods which can be redundant.
            b.  It is hard to figure out what "type" the object is, that is we cannot discern which function created
            which object.
      */
      describe('Problem 2: A simple factory function', function () {
        it('makeObj is the result of a factory function', function () {
          expected = [10, 20];
          obj = makeObj();
          results = [obj.propA, obj.propB];
          expect(results).toEqual(expected);
        });
      });
      
      describe('Problem 3: Make and total invoices', function () {
        beforeEach(() => {
          invoices = [];
          invoices.push(createInvoice());
          invoices.push(createInvoice({ internet: 6500 }));
          invoices.push(createInvoice({ phone: 2000 }));
          invoices.push(createInvoice({ internet: 4500, phone: 1000 }));
        });
        
        it('should total all of the invoices', function () {
          expect(invoiceTotal(invoices)).toBe(31000);
        });
      });

      describe('Problem 4: Make and total payments', function () {
        beforeEach(() => {
          payments = [];
          payments.push(createPayment());
          payments.push(createPayment({ internet: 6500 }));
          payments.push(createPayment({ phone: 2000 }));
          payments.push(createPayment({ internet: 4500, phone: 1000 }));
          payments.push(createPayment({ amount: 10000 }));
        });

        it('should total all of the payments', function () {
          expect(paymentTotal(payments)).toBe(24000);
        });
      });

      describe('Problem 5: add a payments feature to the invoices object', function () {
        let invoice, payment1, payment2, payment3;
        beforeEach(() => {
          invoice = createInvoiceNext({ internet: 4000, phone: 1200 });
          payment1 = createPayment({ amount: 2000 });
          payment2 = createPayment({ internet: 1000, phone: 1200 });
          payment3 = createPayment({ phone: 1000 });
          invoice.addPayment(payment1);
          invoice.addPayments([payment2, payment3]);
        });

        it('should total all invoices and payments', function () {
          expect(invoice.amountDue()).toBe(0);
        });
      });
    });    
  });
});