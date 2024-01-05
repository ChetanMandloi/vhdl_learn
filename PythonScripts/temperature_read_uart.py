import serial
# Press the green button in the gutter to run the script.


def process_temp(num):
    """
    :param num:
    :return:
    """
    if num > 32768:
        return (num - 32768)/128
    else:
        return num/128

if __name__ == '__main__':
    ser = serial.Serial('/dev/ttyUSB1')  # open serial port
    while(True):
        ser.flush()
        bytestring = ser.read(2)

        temp_int = int.from_bytes(bytestring, "big")
        print("temperature = ", process_temp(temp_int), "°C")
