package com.itwill.beep.domain;

import java.util.Optional;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Long> {

    @EntityGraph(attributePaths = "roles")
    Optional<Account> findByUsername(String username);

    // 세상에! 나는 findByUsername으로 Account객체를 만들고 싶었지만 이미 그 메서드이름을 사용하고 있다!
    // 물론 Optional에서 Account를 뽑아쓰면 문제 없겠지만 오히려 그게 코드가 길어지는 상황
    // 그래서 그냥 똑같은 쿼리를 실행하지만 이름이 다른 메서드를 하나 더 만들었다.
    Account findByUsernameIs(String username);

    Account findByUserNickname(String nickname);

    /* follow 기능에 필요한 메서드 */
    Account findByIdIs(Long id);

    Optional<Account> findByStreamingKey(String streamingKey);

}
