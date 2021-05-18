import { JsonpClientBackend } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Country } from 'src/app/common/country';
import { Order } from 'src/app/common/order';
import { OrderItem } from 'src/app/common/order-item';
import { Purchase } from 'src/app/common/purchase';
import { State } from 'src/app/common/state';
import { CartService } from 'src/app/services/cart.service';
import { CheckoutService } from 'src/app/services/checkout.service';
import { Luv2EatFormService } from 'src/app/services/luv2-eat-form.service';
import { Luv2EatValidators } from 'src/app/validators/luv2-eat-validators';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  checkoutFormGroup: FormGroup;

  totalPrice: number =0;
  totalQuantity: number=0;

  creditCardYears: number[] =[];
  creditCardMonths: number[] =[];

  countries: Country[] =[];

  shippingAddressStates: State[] = [];
  billingAddressStates: State[] = [];

  constructor(private formBuilder: FormBuilder,
               private luv2EatFormService: Luv2EatFormService,
               private cartService: CartService,
               private checkoutService: CheckoutService,
               private router: Router) { }

  ngOnInit(): void {

    this.reviewCartDetails();

    this.checkoutFormGroup = this.formBuilder.group({
      customer: this.formBuilder.group({
        firstName: new FormControl('', [Validators.required, Validators.minLength(2),Luv2EatValidators.notOnlyWhitespace]),
        lastName: new FormControl('', [Validators.required, Validators.minLength(2),Luv2EatValidators.notOnlyWhitespace]),
        email: new FormControl('',  [Validators.required, Validators.pattern('^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$'),Luv2EatValidators.notOnlyWhitespace])
      }),
      shippingAddress: this.formBuilder.group({
        street: new FormControl('', [Validators.required, Validators.minLength(6),Luv2EatValidators.notOnlyWhitespace]),
        city: new FormControl('', [Validators.required, Validators.minLength(3),Luv2EatValidators.notOnlyWhitespace]),
        state: new FormControl('', [Validators.required]),
        country:new FormControl('', [Validators.required]),
        zipCode: new FormControl('', [Validators.required, Validators.minLength(6),Luv2EatValidators.notOnlyWhitespace])
      }),
      billingAddress: this.formBuilder.group({
        street: new FormControl('', [Validators.required, Validators.minLength(6),Luv2EatValidators.notOnlyWhitespace]),
        city: new FormControl('', [Validators.required, Validators.minLength(3),Luv2EatValidators.notOnlyWhitespace]),
        state: new FormControl('', [Validators.required]),
        country:new FormControl('', [Validators.required]),
        zipCode: new FormControl('', [Validators.required, Validators.minLength(6),Luv2EatValidators.notOnlyWhitespace])
    

      }),

      creditCard: this.formBuilder.group({
        cardType:  new FormControl('', [Validators.required]),
        nameOnCard: new FormControl('', [Validators.required, Validators.minLength(2),Luv2EatValidators.notOnlyWhitespace]),
        cardNumber: new FormControl('', [Validators.required,Validators.pattern('[0-9]{16}')]),
        securityCode: new FormControl('', [Validators.required,Validators.pattern('[0-9]{3}')]),
        expirationMonth:[''],
        expirationYear:['']
      })

    });

    const startMonth: number = new Date().getMonth() +1;
    console.log("start month:" + startMonth);
    this.luv2EatFormService.getCreditCardMonths(startMonth).subscribe(
      data=>{
        console.log("retrieving credit card months "+ JSON.stringify(data));
        this.creditCardMonths = data;
      }
    );
    this.luv2EatFormService.getCreditCardYears().subscribe(
      data=>{
        console.log("retrieving credit card years" + JSON.stringify(data));
        this.creditCardYears=data;
      }
    );


    this.luv2EatFormService.getCountries().subscribe(
      data =>{
        console.log("retrieving countries: "+ JSON.stringify(data));
        this.countries = data;
      }
    );   
  }

  reviewCartDetails(){
    
    //subscribing to the cartService.totalQuantity and total price
    this.cartService.totalQuantity.subscribe(
      totalQuantity => this.totalQuantity = totalQuantity
    );

    this.cartService.totalPrice.subscribe(
      totalPrice => this.totalPrice = totalPrice
    );
  }

  get firstName(){    return this.checkoutFormGroup.get('customer.firstName');   }
  get lastName(){    return this.checkoutFormGroup.get('customer.lastName');   }
  get email(){    return this.checkoutFormGroup.get('customer.email');   }

  get shippingAddressStreet(){    return this.checkoutFormGroup.get('shippingAddress.street');   }
  get shippingAddressCity(){    return this.checkoutFormGroup.get('shippingAddress.city');   }
  get shippingAddressState(){    return this.checkoutFormGroup.get('shippingAddress.state');   }
  get shippingAddressZipCode(){    return this.checkoutFormGroup.get('shippingAddress.zipCode');   }
  get shippingAddressCountry(){    return this.checkoutFormGroup.get('shippingAddress.country');   }

  get billingAddressStreet(){    return this.checkoutFormGroup.get('billingAddress.street');   }
  get billingAddressCity(){    return this.checkoutFormGroup.get('billingAddress.city');   }
  get billingAddressState(){    return this.checkoutFormGroup.get('billingAddress.state');   }
  get billingAddressZipCode(){    return this.checkoutFormGroup.get('billingAddress.zipCode');   }
  get billingAddressCountry(){    return this.checkoutFormGroup.get('billingAddress.country');   }
  
  get creditCardType(){    return this.checkoutFormGroup.get('creditCard.cardType');   }
  get creditCardNameOnCard(){    return this.checkoutFormGroup.get('creditCard.nameOnCard');   }
  get creditCardNumber(){    return this.checkoutFormGroup.get('creditCard.cardNumber');   }
  get creditCardSecurityCode(){    return this.checkoutFormGroup.get('creditCard.securityCode');   }
  



  onSubmit(){
    console.log("Handling the submit button ");
    if(this.checkoutFormGroup.invalid){
      this.checkoutFormGroup.markAllAsTouched();
      return;
    }

   //set up order
   let order = new Order();
   order.totalPrice = this.totalPrice;
   order.totalQuantity = this.totalQuantity;

   //get cart item
   const cartItems = this.cartService.cartItems;

   // create orderItems from cart Items
   let orderItems: OrderItem[] = cartItems.map(tempCartItem => new OrderItem(tempCartItem));

   //set up purchase
   let purchase = new Purchase();

   //populate purchase - customer
   purchase.customer = this.checkoutFormGroup.controls['customer'].value;

   //populate purchase - shipping address
   purchase.shippingAddress = this.checkoutFormGroup.controls['shippingAddress'].value;
   const shippingState : State = JSON.parse(JSON.stringify(purchase.shippingAddress.state));
   const shippingCountry : Country = JSON.parse(JSON.stringify(purchase.shippingAddress.country));
   purchase.shippingAddress.state = shippingState.name;
   purchase.shippingAddress.country = shippingCountry.name;

   //populate purchse - billing address
   purchase.billingAddress = this.checkoutFormGroup.controls['billingAddress'].value;
   const billingState : State = JSON.parse(JSON.stringify(purchase.billingAddress.state));
   const billingCountry : Country = JSON.parse(JSON.stringify(purchase.billingAddress.country));
   purchase.billingAddress.state = billingState.name;
   purchase.billingAddress.country = billingCountry.name;


   //poplate purchase - order and order Items
   purchase.order = order;
   purchase.orderItems = orderItems;

   //call REST ApI using CheckoutService
   this.checkoutService.placeOrder(purchase).subscribe({
     next: response => {
              alert(`Your order is received.\n Order tracking number: ${response.orderTrackingNumber}`);
    
              //reset the cart
              this.resetCart();
            },
     error: err =>{
       alert(`There was an error: ${err.message}`);
     }

   }
   );
  }

    resetCart(){

      this.cartService.cartItems = [];
      this.cartService.totalPrice.next(0);
      this.cartService.totalQuantity.next(0);

      this.checkoutFormGroup.reset();

      this.router.navigateByUrl("/products");
    }


  copyShippingAddressToBillingAddress(event){
    if(event.target.checked){
      this.checkoutFormGroup.controls.billingAddress
          .setValue(this.checkoutFormGroup.controls.shippingAddress.value);
    }
    else{
      this.checkoutFormGroup.controls.billingAddress.reset();
    }
  }

  handleMonthsAndYears(){

    const creditCardFormGroup = this.checkoutFormGroup.get('creditCard');
    const currentYear: number = new Date().getFullYear();
    const selectedYear: number = Number(creditCardFormGroup.value.expirationYear);

    let startMonth: number;
    if(currentYear === selectedYear){
      startMonth= new Date().getMonth() +1 ;
    }
    else{
      startMonth = 1;
    }
    this.luv2EatFormService.getCreditCardMonths(startMonth).subscribe(
      data=> {
        console.log("Retrieving credit card months: "+ JSON.stringify(data));
        this.creditCardMonths= data;
      }
    );
  }



  getStates(formGroupName: string){
    const formGroup = this.checkoutFormGroup.get(formGroupName);
    const countryCode = formGroup.value.country.name;

    console.log(`{formGroupName} country code: ${countryCode}`);
    

    this.luv2EatFormService.getStates(countryCode).subscribe(
      data=>{
        if(formGroupName === 'shippingAddress'){
        this.shippingAddressStates = data;
      }
      else{
        this.billingAddressStates = data;
      }
      // selecting the first state a default
      formGroup.get('state').setValue(data[0]);
    }
    );
  }
}