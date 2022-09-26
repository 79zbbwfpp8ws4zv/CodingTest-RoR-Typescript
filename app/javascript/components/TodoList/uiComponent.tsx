import React from "react";
import { Button } from "react-bootstrap";
import styled from "styled-components";

export const ResetButton = styled(Button)`
  margin-top: 1em;
`;

export const RemoveButton = Button;

export const FlexContainer = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
`;
