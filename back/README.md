# back

## Build steps

### Development

Install dependencies:

```console
$ composer install
```

Copy `.env.example` into `.env` and setup environment variables. Do not forget to generate 32 characters long app key.

Start php development server:

```console
$ php -S localhost:8000 -t public
```
