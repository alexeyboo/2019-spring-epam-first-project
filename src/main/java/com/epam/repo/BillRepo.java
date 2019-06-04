package com.epam.repo;

import com.epam.domain.Bill;
import com.epam.domain.enums.BillStatus;
import com.epam.utils.DBConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import lombok.SneakyThrows;

public class BillRepo implements Repository<Bill, Long> {

    Statement statement = null;
    String sql = null;

    public BillRepo() {
        sql = "SELECT * FROM BILL WHERE ID = ";
    }


    @SneakyThrows
    @Override
    public Bill save(Bill item) {
        if (item == null) {
            return null;
        } else {

            Long userId = item.getUserId();
            Long bookingId = item.getBookingId();
            BillStatus status = item.getStatus();

            PreparedStatement preparedStatement = getPreparedStatement(
                "INSERT INTO BILL ( USER_ID, BOOKING_ID, STATUS) VALUES( ?, ?, ?)");
//            preparedStatement.setLong(1, id);
            preparedStatement.setLong(1, userId);
            preparedStatement.setLong(2, bookingId);
            preparedStatement.setString(3, status.name());

            preparedStatement.executeUpdate();

        }

        return item;
    }

    // TODO
    @Override
    public Bill removeById(Long id) {
        Bill bill = null;

        if (id == null) {
            return null;
        } else {

        }

        return bill;
    }

    @SneakyThrows
    @Override
    public Bill findById(Long id) {
        ResultSet resultSet = null;
        Bill bill = null;

        if (id == null) {
            return null;
        } else {

            PreparedStatement preparedStatement = getPreparedStatement(
                "SELECT * FROM BILL WHERE ID = ?");
            preparedStatement.setLong(1, id);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Long tmpId = Long.parseLong(resultSet.getString("ID"));
                if (tmpId.equals(id)) {

                    long bookingId = Long.parseLong(resultSet.getString("BOOKING_ID"));
                    long userId = Long.parseLong(resultSet.getString("USER_ID"));

                    String status = resultSet.getString("STATUS");

                    bill = Bill.builder().id(tmpId).bookingId(bookingId).userId(userId)
                        .status(Enum.valueOf(BillStatus.class, status)).build();

                }

            }
        }
        return bill;
    }

    @SneakyThrows
    @Override
    public Bill update(Bill item) {
        ResultSet resultSet = null;

        if (item == null) {
            return null;
        } else {

            Long id = item.getId();
            Long userId = item.getUserId();
            Long bookingId = item.getBookingId();
            BillStatus billStatus = item.getStatus();

            PreparedStatement preparedStatement = getPreparedStatement(
                " UPDATE BILL SET USER_ID = ?,  BOOKING_ID = ? , STATUS = ?, WHERE ID = ?");
            preparedStatement.setLong(1, userId);
            preparedStatement.setLong(2, bookingId);
            preparedStatement.setString(3, billStatus.name());
            preparedStatement.setLong(4, id);

            preparedStatement.execute();
        }

        return item;
    }

    //TODO
    @Override
    public Iterable<Bill> findAll() {
        return null;
    }

    @SneakyThrows
    private PreparedStatement getPreparedStatement(String sql) {
        Connection connection = DBConnectionUtils.getConnection();
        return connection.prepareStatement(sql);
    }

    @SneakyThrows
    private Statement getStatement() {
        Connection connection = DBConnectionUtils.getConnection();
        return connection.createStatement();
    }
}
