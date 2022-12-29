package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private static Map<Integer,Customer> customers;
    static {
        customers = new HashMap<>();
        customers.put(1,new Customer(1,"Nguyễn Thị Hoa","hoanguyen@gmail.com","Hà Nội"));
        customers.put(2,new Customer(2,"Trần Văn Thành","thanhtran@gmail.com","Đà Nẵng"));
        customers.put(3,new Customer(3,"Lê Văn An","anle@gmail.com","Hải Phòng"));
        customers.put(4,new Customer(4,"Đặng Tiều Minh","binhdang@gmail.com","Thanh Hóa"));
        customers.put(5,new Customer(5,"Châu Nhuận Phát","phatchau@gmail.com","Hồ Chí Minh"));
        customers.put(6,new Customer(6,"Hứa Vỹ Văn","vanhua@gmail.com","Long An"));
    }


    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(),customer);

    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customers.put(id,customer);

    }

    @Override
    public void remove(int id) {
        customers.remove(id);

    }
}
