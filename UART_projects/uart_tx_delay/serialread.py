import serial
import time
serial_port = serial.Serial('/dev/ttyUSB1', 9600)
start_time = time.time()
elapsed_time = 0.0
datain = ""
while(elapsed_time <= 1800.0):
        curr_time = time.time()
        elapsed_time = curr_time-start_time
        datain = datain + serial_port.read().decode()
print(datain)
print("len of datain is ", len(datain))
