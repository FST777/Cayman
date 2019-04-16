# cayman

*CA Man*ager. No one knows where the *y* came from. `cayman` is a shell script
that acts as a wrapper around OpenSSL to manage, sign and revoke CAs and
certificates in a semi-standardized way.

# Set up

Put `cayman`, `cayman.conf` and `openssl.conf` somewhere together and edit
`cayman.conf` to reflect the details of your operation.

As per the usage, initialize your first top-level CA with `cayman init`.

## Usage

```
Usage: cayman [ options ... ] [COMMAND] [arguments]

Valid options are:
  -c <config-file>  Specify the OpenSSL configuration to work with
                    (default: ./cayman-openssl.cnf)
  -d <folder>       Specify the folder to work on (default: ${HOME}/ssl/CA/)
                    This folder will hold the Root CA and intermediate
                    CAs as sub-folders.
  -i <intermediate> Work on <intermediate> (instead of the Root CA)
  -h                Show this help

Valid commands are:
  init              Initialise the specified CA
  reinit            Reissue the specified CA (in case of expiry or similar)
  sign [<file>]     Sign a supplied *.csr file (use - for STDIN) or \$CSR
  list              List all signed certificates with their serial and validity
  list-revoked      List all revoked certificates
  revoke <serial>   Revoke the certificate matching <serial>
  gencrl            Regenerate a CA's CRL
  echo <serial>     Output the certificate matching <serial>
  help              Show this help
```

## License

Like OpenSSL, this software is licensed under the terms of the [Apache License (v2.0)](LICENSE)
