import time

import jwt

from service_account_credentials import (
    PRIVATE_KEY_ID_FROM_JSON,
    PRIVATE_KEY_FROM_JSON,
    ISS,
    SUB,
    AUD
)


iat = time.time()
exp = iat + 3600  # Valid for 1 hour - Seems to be the maximum allowed
payload = {'iss': ISS,
           'sub': SUB,
           'aud': AUD,
           'iat': iat,
           'exp': exp}

additional_headers = {'kid': PRIVATE_KEY_ID_FROM_JSON}
signed_jwt = jwt.encode(payload, PRIVATE_KEY_FROM_JSON, headers=additional_headers,
                                  algorithm='RS256')
signed_jwt = signed_jwt.decode('ascii')
print(signed_jwt)
