import serial
# Press the green button in the gutter to run the script.

def calc_g(num):
    """
    :param num:
    :return:
    """
    return num/1024
def process_sign(num):
    """

    :param num:
    :return:
    """
    if num < 2047:
        return num
    else:
        return -(4096 - num)

if __name__ == '__main__':
    ser = serial.Serial('/dev/ttyUSB1')  # open serial port
    while(True):
        ser.flush()
        bytestring = ser.read(6)
        hexstring = bytestring.hex()
        #print(hexstring)
        x_int = int(hexstring[1:4], 16)
        y_int = int(hexstring[5:8], 16)
        z_int = int(hexstring[9:12], 16)
        print("x = ", process_sign(x_int), "y = ", process_sign(y_int), "z = ", process_sign(z_int - 160
                                                                                             ))
