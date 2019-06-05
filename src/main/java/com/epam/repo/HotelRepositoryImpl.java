package com.epam.repo;

import com.epam.domain.Hotel;
import com.epam.domain.Room;
import com.epam.utils.DBConnectionUtils;
import lombok.Cleanup;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class HotelRepositoryImpl implements Repository<Hotel, Long> {
//    RoomRepositoryImpl roomRepository = new RoomRepositoryImpl();

    private long id;
    private String name;
    private String location;
    private int luxury;
    private List<Room> rooms;

    @Override
    @SneakyThrows
    public Hotel save(Hotel hotel) {
        if (hotel == null) {
            return null;
        } else {
            @Cleanup
            Statement statement = getStatement();

            id = hotel.getId();
            name = hotel.getName();
            location = hotel.getLocation();
            luxury = hotel.getLuxury();
            rooms = hotel.getRooms();

//            for (Room room : rooms) {
//                roomRepository.save(room);
//            }

            statement.execute("INSERT INTO HOTEL (ID, NAME, LOCATION, LUXURY) VALUES (" +
                    id + ", " + name + ", " + location + ", " + luxury + ")");

            return hotel;
        }
    }

    @Override
    @SneakyThrows
    public Hotel removeById(Long id) {
        if (id == null) {
            return null;
        } else {
            Hotel hotel = findById(id);
            rooms = hotel.getRooms();

//            for (Room room : rooms) {
//                roomRepository.removeById(room.getId());
//            }

            @Cleanup
            Statement statement = getStatement();
            statement.execute("DELETE FROM HOTEL WHERE ID = " + id);

            return hotel;
        }
    }

    @Override
    @SneakyThrows
    public Hotel findById(Long id) {
        if (id == null) {
            return null;
        } else {
            @Cleanup
            Statement statement = getStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM HOTEL WHERE ID = " + id);

            Hotel hotel = Hotel.builder().build();

            while (resultSet.next()) {
                name = resultSet.getString("NAME");
                location = resultSet.getString("LOCATION");
                luxury = resultSet.getInt("LUXURY");
                rooms = null;
            }

            hotel.setId(id);
            hotel.setName(name);
            hotel.setLocation(location);
            hotel.setLuxury(luxury);
            hotel.setRooms(rooms);

            return hotel;
        }
    }

    @Override
    @SneakyThrows
    public Hotel update(Hotel hotel) {
        if (hotel == null) {
            return null;
        } else {
            @Cleanup
            Statement statement = getStatement();

            id = hotel.getId();
            name = hotel.getName();
            location = hotel.getLocation();
            luxury = hotel.getLuxury();
            rooms = hotel.getRooms();

//            for (Room room : rooms) {
//                roomRepository.update(room);
//            }

            statement.execute("UPDATE HOTEL SET NAME \'" + name + "\', LOCATION \'" + location + "\', LUXURY = \'" + luxury + "\' WHERE ID = " + id);

            return hotel;
        }
    }

    @Override
    public Iterable<Hotel> findAll() {
        Statement statement = getStatement();

        return null;
    }

    @SneakyThrows
    private Statement getStatement() {
        Connection connection = DBConnectionUtils.getConnection();
        Statement statement = connection.createStatement();
        return statement;
    }
}