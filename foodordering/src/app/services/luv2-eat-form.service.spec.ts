import { TestBed } from '@angular/core/testing';

import { Luv2EatFormService } from './luv2-eat-form.service';

describe('Luv2EatFormService', () => {
  let service: Luv2EatFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Luv2EatFormService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
