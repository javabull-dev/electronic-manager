package cn.ljpc.electronic.sys.vo;
import cn.ljpc.electronic.sys.entity.Dept;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class DeptVo extends Dept {

    private Integer page=1;
    private Integer limit=10;

}
