package com.epam.domain;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder(toBuilder=true)
@NoArgsConstructor
public class Booking {
    private long id;
    private LocalDate start;
    private LocalDate end;
}