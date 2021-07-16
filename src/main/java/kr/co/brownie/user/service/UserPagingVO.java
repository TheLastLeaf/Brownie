package kr.co.brownie.user.service;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class UserPagingVO {
    List<UserVO> userVOList;
    int contentPerPage;
    int startPageNumber;
    int currentPageNumber;
    int endPageNumber;
    int totalPageNumber;
}
