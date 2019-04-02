package service;

import pojo.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> list();
    void add(Goods goods);
    void delete(Goods goods);
    void update(Goods goods);
    Goods get(int id);
}
