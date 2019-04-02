package mapper;

import pojo.Goods;

import java.util.List;

public interface GoodsMapper {
    public int add(Goods goods);
    public void delete(int id);
    public int update(Goods goods);
    public Goods get(int id);
    public List<Goods> list();
    public int count();
}
