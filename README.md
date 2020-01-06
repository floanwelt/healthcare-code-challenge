# healthcare-code-challenge

## Create JWT
1. Fill in the details in service_account_credentials_dummy.py and save as service_account_credentials.py
2. Run 'python3 create_jwt.py'
3. Copy the printed key

## Paste fresh key into the Connection Manager
4. Open ConnectionManager.swift
5. Paste JWT in authString variable and replace old JWT (Must be in the format "Bearer [JWT]"

## Start App in the iPad Simulator
1. I had been running it on an ipad air 3rd generation simulator, but should also run on other simulators
!!! Will most likely not run on a device as another compilation of imebra needs to be used for that accroding to the docs !!!
2. After startup it may take a few seconds to connect to the API and download the data (Save to enter second view before data is downloaded since the last fix)
3. Push the button to get to the image view and enjoy your view of the DICOM images
4. Use the slider to play around

## If it does not work maybe the library needs to be recompiled and connected
1. Imebra 5.0.1.1 can be found in the repo
2. Download CMake https://cmake.org/download/
3. Compile accordingly for use on simulator

```
mkdir imebra_for_ios_simulator
cd imebra_for_ios_simulator
cmake your_imebra_location -DIOS=SIMULATOR
cmake --build .
```

Afterwards it may need to be linked as well.

Further information can be found here: https://imebra.com/wp-content/uploads/documentation/5.0/html/compiling_imebra.html


