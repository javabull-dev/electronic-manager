package cn.ljpc.electronic.bus.entity;

import lombok.Data;
import lombok.Setter;

import java.util.Date;

@Data
@Setter
public class InportVo {

    private Integer id;

    private String paytype;

    private Date inporttime;

    private String operateperson;

    private String number;

    private String remark;

    private Double inportprice;

    private String providerid;

    private String goodsid;

    private String size;
    /**
     * 元器件的唯一标识
     */
    private String uuid;
}
