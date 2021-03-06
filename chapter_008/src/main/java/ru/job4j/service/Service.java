package ru.job4j.service;

import ru.job4j.models.Account;
import ru.job4j.models.Seat;
import ru.job4j.persistence.DBAccounts;
import ru.job4j.persistence.DBHalls;

import java.util.Collections;
import java.util.List;

/**
 * Created by Intellij IDEA.
 * User: Vitaly Zubov.
 * Email: Zubov.VP@yandex.ru.
 * Version: $Id$.
 * Date: 15.07.2019.
 */
public class Service implements Actions<Seat> {
    private static final Service INSTANCE = new Service();
    private static DBAccounts dbAccounts = DBAccounts.getInstance();
    private static DBHalls dbHalls = DBHalls.getInstance();

    public static Service getInstance() {
        return INSTANCE;
    }

    /**
     * Constructor.
     */
    private Service() {
    }

    /**
     * Get all seats from  database.
     *
     * @return List of seats.
     */
    @Override
    public List<Seat> getSeats() {
        List<Seat> result = dbHalls.getPlaces();
        Collections.sort(result);
        return result;
    }

    /**
     * Get seat.
     *
     * @param id - id of seat.
     * @return - seat.
     */
    @Override
    public Seat getSeat(int id) {
        return dbHalls.getSeat(id);
    }

    @Override
    public boolean reserveSeat(int id, String status) {
        return dbHalls.reserve(id);
    }

    /**
     * Pay seat.
     *
     * @param id       - id of seat.
     * @param status   - status.
     * @param userName - userName.
     * @param phone    - phone of user.
     */
    @Override
    public void paySeat(int id, String status, String userName, String phone) {
        Account account = checkAccount(phone);
        if (account == null) {
            account = new Account(userName, phone);
            account = dbAccounts.add(account);
        }
        dbHalls.sold(id, account.getId());
    }

    /**
     * Delete status reserve from database.
     */
    @Override
    public void deleteReserve() {
        dbHalls.deleteReserve();
    }


    /**
     * Close connections.
     */
    @Override
    public void close() {
        dbAccounts.close();
        dbHalls.close();
    }

    /**
     * Check account ih the database.
     *
     * @param phone - phone of account.
     * @return - account.
     */
    private Account checkAccount(String phone) {
        Account result;
        result = dbAccounts.get(phone);
        return result;
    }
}
