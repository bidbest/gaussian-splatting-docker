from math import radians, cos, sin, asin, sqrt
import matplotlib.pyplot as plt
import numpy as np
import re

def lat_lon_to_xyz(lat1, lon1, lat2, lon2, alt1, alt2):
    """
    Convert latitude and longitude to 3D Cartesian coordinates (x, y, z).
    x is the east-west distance, y is the north-south distance, and z is the altitude difference.
    """
    # Constants
    meters_per_degree_lat = 111000  # Approximate meters per degree of latitude

    # Calculate the x and y distances in meters
    y_distance = (lat2 - lat1) * meters_per_degree_lat
    x_distance = (lon2 - lon1) * meters_per_degree_lat * cos(radians(lat1))

    # Z distance is the altitude difference
    z_distance = alt2 - alt1

    return x_distance, y_distance, z_distance


def read_file(path):
    with open(in_p, 'r') as f:
        data=f.readlines()

    assert  len(data) % 6 == 0, "check file for correctness"

    n_frames = int(len(data) // 6)

    organized_data = []
    for i in range(n_frames):
        ind = i * 6

        n_frame = int(data[ind].split('\n')[0])
        time_diff = data[ind+2].split(':')[-1]
        time_diff = float(time_diff.split('ms\n')[0])/1000

        geo_data = data[ind+4]
        latitude = re.search(r'\[latitude: ([\d.+-]+)\]', geo_data)
        longitude = re.search(r'\[longitude: ([\d.+-]+)\]', geo_data)
        abs_altitude = re.search(r' abs_alt: ([\d.+-]+)\]', geo_data)

        latitude_value = float(latitude.group(1)) if latitude else None
        longitude_value = float(longitude.group(1)) if longitude else None
        abs_altitude_value = float(abs_altitude.group(1)) if abs_altitude else None

        if (
            latitude_value is not None and
            longitude_value is not None and
            abs_altitude_value is not None
            ):

            organized_data.append([n_frame, time_diff, latitude_value, longitude_value, abs_altitude_value])

    organized_data = np.asarray(organized_data)

    return organized_data


def convert_data_to_xyz_m(organized_data):

    origin = organized_data[0,2:]
    new_poses = [
        lat_lon_to_xyz(origin[0], origin[1], tmp[0], tmp[1], origin[2], tmp[2])
        for tmp in organized_data[:, 2:]
        ]

    new_poses = np.asarray(new_poses)

    return new_poses


def smooth_poses(new_poses, window_size=15):

    window = np.ones(window_size) / window_size
    new_poses[:,0] = np.convolve(new_poses[:,0], window, 'same')
    new_poses[:,1] = np.convolve(new_poses[:,1], window, 'same')
    new_poses[:,2] = np.convolve(new_poses[:,2], window, 'same')

    return new_poses


def compute_displacment(new_poses, filter_size=15):

    diff = np.zeros(new_poses.shape)
    diff[1:] = np.diff(new_poses, axis=0)
    displ = np.linalg.norm(diff, axis=1)
    window = np.ones(filter_size) / filter_size
    displ = np.convolve(displ, window, 'same')

    return displ


def show_fly_data(new_poses, displ):

    plt.figure(1)
    plt.plot(new_poses[:,0])
    plt.plot(new_poses[:,1])
    plt.plot(new_poses[:,2])
    plt.figure(2)
    plt.plot(displ)
    plt.show()

def main():

    path =  "/mnt/c/Users/bidof/Videos/drone/3d_scan_test/DJI_0122.SRT"
    organized_data = read_file(path)
    new_poses = convert_data_to_xyz_m(organized_data)
    new_poses = smooth_poses(new_poses)
    displ = compute_displacment(new_poses)
    show_fly_data(new_poses, displ)


if __name__ == '__main__':
    main()