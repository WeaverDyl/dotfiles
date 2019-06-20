#!/usr/bin/env python

import os
import sys
from apiclient import discovery, errors
from oauth2client import client, file
from httplib2 import ServerNotFoundError

DIR = os.path.dirname(os.path.realpath(__file__))
CREDENTIALS_PATH = os.path.join(DIR, 'credentials.json')

def get_count(creds):
    gmail = discovery.build('gmail', 'v1', credentials=creds)
    list = gmail.users().messages().list(userId='me', q='in:inbox is:unread category:primary').execute()
    return list['resultSizeEstimate']

try:
    creds = file.Storage(CREDENTIALS_PATH).get()
    if creds is not None:
        count = get_count(creds)
        print(count, ('unread emails' if count != 1 else 'unread email'))
    else:
        print('credentials not found', file=sys.stderr)
except (errors.HttpError, ServerNotFoundError) as error:
    print("No Internet", file=sys.stderr)
except client.AccessTokenRefreshError:
    print('revoked/expired credentials', file=sys.stderr)

