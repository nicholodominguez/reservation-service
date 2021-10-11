curl -d '{"start_date": "2021-03-12","end_date": "2021-03-16","nights": 4,"guests": 4,"adults": 2,"children": 2,"infants": 0,"status": "accepted","guest": {"id": 1,"first_name": "Test","last_name": "User","phone": "639123456789","email": "test_user@bnb.com"},"currency": "AUD","payout_price": "3800.00","security_price": "500","total_price": "4500.00"}' -H 'Content-Type: application/json' http://localhost:4000/api/v1/guests

# API Contracts - JSON format

POST /api/v1/guests

Expected response:

```
{
  "guest": {
    "id": 2,
    "first_name": "Test",
    "last_name": "User",
    "email": "test_user@bnb.com",
    "phone_numbers": ["639123456789","639123456789"],
    "created_at": "2021-10-11T10:15:22.983Z",
    "updated_at": "2021-10-11T10:15:22.983Z"
  },
  "reservation": [{
    "id": 4,
    "guest_id": 2,
    "start_date": "2021-03-12T00:00:00.000Z",
    "end_date": "2021-03-16T00:00:00.000Z",
    "nights": 4,
    "guests": 4,
    "adults": 2,
    "children": 2,
    "infants": 0,
    "currency": "AUD",
    "description": "4 guests",
    "payout_price": "3800.0",
    "security_price": "500.0",
    "total_price": "4500.0",
    "status": "accepted",
    "created_at": "2021-10-11T10:15:22.986Z",
    "updated_at": "2021-10-11T10:15:22.986Z"
  }]
}
```