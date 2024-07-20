# Fleat Management System API Documentation

## Base URL

http://localhost:3000

## Authentication

All endpoints require a valid JWT  to be included in the request headers.

```http
Authorization: Bearer YOUR_TOKEN
```

## Endpoints

### Users endpoint

| Name | Description |
| --- | --- |
| `GET /users` | Returns all users. |
| `POST /users` | Creates a new user. |

1. Get all users

```http
GET /users
```

Authentication: `Bearer YOUR_TOKEN`

Response:
status: 200
```json
[
    {
        "id": 1,
        "username": "admin",
        "email": "admin@mail.com"
    }
]
```


status: 401
```json
{
    "errors": [
        "Unauthorized"
    ]
}
```

---

2. Create a new user

```http
POST /users
```

Authentication: none

Request:
```json
{
    "user": {
        "username": "admin",
        "email": "admin@mail.com",
        "password": "123456789"
    }
}
```

Response:
status: 201
```json
{
    "auth_token": "YOUR_TOKEN"
}
```

status: 422
```json
{
    "errors": [
        "Email has already been taken"
        "..."
    ]
}
```

### Auth endpoint

| Name | Description |
| --- | --- |
| `POST /auth` | Authenticates a user. |  
| `GET /auth` | Returns the authenticated user. |

1. Authenticate a user

```http
POST /auth
```

Authentication: none

Request:
```json
{
    "auth": {
        "username": "admin",
        "password": "123456789"
    }
}
```

Response:
status: 201
```json
{
    "auth_token": "YOUR_TOKEN"
}
```

status: 401
```json
{
    "errors": [
        "Invalid username or password"
    ]
}
```
---

2. Get the authenticated user

```http
GET /auth
```

Authentication: `Bearer YOUR_TOKEN`

Response:
status: 200
```json
{
    "id": 1,
    "username": "admin",
    "email": "admin@mail.com"
}
```

status: 401
```json
{
    "errors": [
        "Unauthorized"
    ]
}
```

### Bookings endpoint

| Name | Description |
| --- | --- |
| `GET /bookings/all` | Returns all bookings. |
| `GET /bookings` | Returns logged in user's bookings. |
| `POST /bookings` | Creates a new booking. |

1. Get all bookings

```http
GET /bookings/all
```

Authentication: `Bearer YOUR_TOKEN`

Response:
status: 200
```json
[
    {
        "id": 1,
        "user_id": 1,
        "trip_id": 1,
        "seat_id": 1,
        "from_station_id": 1,
        "to_station_id": 1,
        "created_at": "2020-01-01T00:00:00.000Z",
        "updated_at": "2020-01-01T00:00:00.000Z"
    }
]
```

status: 401
```json
{
    "errors": [
        "Unauthorized"
    ]
}
```

---

2. Get logged in user's bookings

```http
GET /bookings
```

Authentication: `Bearer YOUR_TOKEN`

Response:
status: 200
```json
[
    {
        "id": 1,
        "user_id": 1,
        "trip_id": 1,
        "seat_id": 1,
        "from_station_id": 1,
        "to_station_id": 1,
        "created_at": "2020-01-01T00:00:00.000Z",
        "updated_at": "2020-01-01T00:00:00.000Z"
    }
]
```

status: 401
```json
{
    "errors": [
        "Unauthorized"
    ]
}
```

---

3. Create a new booking

```http
POST /bookings
```

Authentication: `Bearer YOUR_TOKEN`

Request:
```json
{
    "booking": {
        "trip_id": 1,
        "seat_id": 1,
        "from_station_id": 1,
        "to_station_id": 1
    }
}
```

Response:
status: 201
```json
{
    "id": 1,
    "user_id": 1,
    "trip_id": 1,
    "seat_id": 1,
    "from_station_id": 1,
    "to_station_id": 1,
    "created_at": "2020-01-01T00:00:00.000Z",
    "updated_at": "2020-01-01T00:00:00.000Z"
}
```

status: 401
```json
{
    "errors": [
        "Unauthorized"
    ]
}
```

status: 422
```json
{
    "errors": [
        "seat already booked"
    ]
}
```

### Seats endpoint

| Name | Description |
| --- | --- |
| `GET /seats/:from_station/:to_station` | Returns available seats. |

1. Get available seats

```http
GET /seats/:from_station/:to_station
```

Authentication: `Bearer YOUR_TOKEN`

Response:
status: 200
```json
[
  {
    "trip_id": 1,
    "seats": [
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12
    ]
  }
]
```

status: 401
```json
{
    "errors": [
        "Unauthorized"
    ]
}
```
