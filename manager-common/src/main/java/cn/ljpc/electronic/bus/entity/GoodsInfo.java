package cn.ljpc.electronic.bus.entity;

import lombok.Data;
import lombok.Setter;

@Data
@Setter
public class GoodsInfo {
    private Integer providerid;
    private Integer goodsid;

    private String goodsname;
    private String providername;

    private String uuid;
}
